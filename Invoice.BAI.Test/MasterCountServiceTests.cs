using Invoice.BAL.Services;
using Invoice.BAL.Contracts;
using Invoice.DAL.Contracts;
using Invoice.DAL.Repositories;
using Invoice.Data.Entities;
using Invoice.DTOs;
using Moq;

namespace Invoice.BAL.Test.Services;

public class MasterCountServiceTests
{
    private readonly Mock<ICustomerRepository> _customersMock;
    private readonly Mock<IItemmasterRepository> _itemsMock;
    private readonly Mock<IUsersRepository> _usersMock;
    private readonly Mock<ICategoryService> _categoriesMock;
    private readonly Mock<IVendorService> _vendorsMock;
    private readonly MasterCountService _service;

    public MasterCountServiceTests()
    {
        _customersMock = new Mock<ICustomerRepository>();
        _itemsMock = new Mock<IItemmasterRepository>();
        _usersMock = new Mock<IUsersRepository>();
        _categoriesMock = new Mock<ICategoryService>();
        _vendorsMock = new Mock<IVendorService>();

        _service = new MasterCountService(
            _customersMock.Object,
            _itemsMock.Object,
            _usersMock.Object,
            _categoriesMock.Object,
            _vendorsMock.Object);
    }

    private static CategoryDto CreateCategory(int id = 1, string? name = "Cat") =>
        new CategoryDto { Id = id, Name = name };

    private static CustomerEntity CreateCustomer(int id = 1, string? city = "Chennai", bool isActive = true, bool isDeleted = false) =>
        new CustomerEntity { Id = id, City = city, IsActive = isActive, IsDeleted = isDeleted };

    private static VendorDto CreateVendor(int id = 1, string? city = "Chennai", bool isActive = true) =>
        new VendorDto { Id = id, City = city, IsActive = isActive };

    private static UsersEntity CreateUser(int id = 1, string? city = "Chennai", bool isActive = true, bool isDeleted = false) =>
        new UsersEntity { Id = id, City = city ?? string.Empty, IsActive = isActive, IsDeleted = isDeleted };

    [Fact]
    public async Task GetCategoryNamesAsync_ShouldReturnDistinctOrderedTrimmedNames()
    {
        _categoriesMock
            .Setup(x => x.GetAllAsync())
            .ReturnsAsync(new[]
            {
                CreateCategory(1, " Rice "),
                CreateCategory(2, "rice"),
                CreateCategory(3, "Wheat"),
                CreateCategory(4, null)
            } as IEnumerable<CategoryDto>);

        var result = await _service.GetCategoryNamesAsync();

        Assert.Equal(2, result.Count);
        Assert.Equal("Rice", result[0]);
        Assert.Equal("Wheat", result[1]);
    }

    [Fact]
    public async Task GetCityNamesAsync_ShouldReturnDistinctOrderedTrimmed()
    {
        _customersMock
            .Setup(x => x.GetAllAsync())
            .ReturnsAsync(new List<CustomerEntity>
            {
                CreateCustomer(1, " Chennai "),
                CreateCustomer(2, "chennai"),
                CreateCustomer(3, "Bengaluru"),
                CreateCustomer(4, ""),
            });

        var result = await _service.GetCityNamesAsync();

        Assert.Equal(2, result.Count);
        Assert.Equal("Bengaluru", result[0]);
        Assert.Equal("Chennai", result[1]);
    }

    [Fact]
    public async Task CountCategoriesAsync_ShouldRespectIsActive()
    {
        _categoriesMock
            .Setup(x => x.GetAllAsync())
            .ReturnsAsync(new[]
            {
                new CategoryDto { Id = 1, IsActive = true },
                new CategoryDto { Id = 2, IsActive = false },
                new CategoryDto { Id = 3, IsActive = true }
            } as IEnumerable<CategoryDto>);

        Assert.Equal(3, await _service.CountCategoriesAsync(null));
        Assert.Equal(2, await _service.CountCategoriesAsync(true));
        Assert.Equal(1, await _service.CountCategoriesAsync(false));
    }

    [Fact]
    public async Task CountItemsInCategoryAsync_ShouldReturnNull_WhenCategoryNotFound()
    {
        _categoriesMock
            .Setup(x => x.GetAllAsync())
            .ReturnsAsync(Array.Empty<CategoryDto>());

        var result = await _service.CountItemsInCategoryAsync("Nope", null);

        Assert.Null(result);
    }

    [Fact]
    public async Task CountItemsInCategoryAsync_ShouldReturnCount_WhenCategoryFound()
    {
        _categoriesMock
            .Setup(x => x.GetAllAsync())
            .ReturnsAsync(new[] { new CategoryDto { Id = 5, Name = "CatA" } } as IEnumerable<CategoryDto>);

        _itemsMock
            .Setup(x => x.GetAllPagedAsync(It.IsAny<ItemmasterFilterDto>()))
            .ReturnsAsync(new PagedResultDto<ItemmasterEntity> { TotalRecords = 42 });

        var result = await _service.CountItemsInCategoryAsync("CatA", null);

        Assert.Equal(42, result);
    }

    [Fact]
    public async Task CountItemsAsync_ShouldReturnTotalRecords()
    {
        _itemsMock
            .Setup(x => x.GetAllPagedAsync(It.IsAny<ItemmasterFilterDto>()))
            .ReturnsAsync(new PagedResultDto<ItemmasterEntity> { TotalRecords = 7 });

        var result = await _service.CountItemsAsync(null, null);

        Assert.Equal(7, result);
    }

    [Fact]
    public async Task CountCustomersAsync_ShouldReturnRepositoryCount()
    {
        _customersMock
            .Setup(x => x.GetCustomerCountAsync(true))
            .ReturnsAsync(123);

        var result = await _service.CountCustomersAsync(true);

        Assert.Equal(123, result);
    }

    [Fact]
    public async Task CountCustomersByCityAsync_ShouldReturnCorrectCount()
    {
        _customersMock
            .Setup(x => x.GetAllAsync())
            .ReturnsAsync(new List<CustomerEntity>
            {
                CreateCustomer(1, "Chennai", true, false),
                CreateCustomer(2, "Chennai", true, false),
                CreateCustomer(3, "Bengaluru", true, false),
                CreateCustomer(4, "Chennai", false, true) // deleted - should be excluded
            });

        var result = await _service.CountCustomersByCityAsync("Chennai", true);

        Assert.Equal(2, result);
    }

    [Fact]
    public async Task CountCustomersGroupedByCityAsync_ShouldReturnGroups()
    {
        _customersMock
            .Setup(x => x.GetAllAsync())
            .ReturnsAsync(new List<CustomerEntity>
            {
                CreateCustomer(1, "A"),
                CreateCustomer(2, "B"),
                CreateCustomer(3, "A"),
                CreateCustomer(4, "")
            });

        var result = await _service.CountCustomersGroupedByCityAsync(null);

        Assert.Equal(2, result.Count);
        Assert.Equal("A", result[0].City);
        Assert.Equal(2, result[0].Count);
    }

    [Fact]
    public async Task CountVendorsAsync_ShouldRespectIsActive()
    {
        _vendorsMock
            .Setup(x => x.GetAllAsync())
            .ReturnsAsync(new[] { CreateVendor(1, "C", true), CreateVendor(2, "D", false) } as IEnumerable<VendorDto>);

        Assert.Equal(2, await _service.CountVendorsAsync(null));
        Assert.Equal(1, await _service.CountVendorsAsync(true));
        Assert.Equal(1, await _service.CountVendorsAsync(false));
    }

    [Fact]
    public async Task CountUsersAsync_ShouldExcludeDeletedAndFilterByIsActive()
    {
        _usersMock
            .Setup(x => x.GetAllAsync())
            .ReturnsAsync(new[] {
                CreateUser(1, "C", true, false),
                CreateUser(2, "D", false, false),
                CreateUser(3, "E", true, true) // deleted
            } as IEnumerable<UsersEntity>);

        Assert.Equal(3 - 1, await _service.CountUsersAsync(null));
        Assert.Equal(1, await _service.CountUsersAsync(true));
        Assert.Equal(1, await _service.CountUsersAsync(false));
    }
}
