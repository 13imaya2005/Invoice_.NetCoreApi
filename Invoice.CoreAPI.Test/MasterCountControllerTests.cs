using Invoice.BAL.Contracts;
using Invoice.CoreAPI.Controllers;
using Invoice.DTOs;
using Invoice.Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Moq;

namespace Invoice.CoreAPI.Test;

public class MasterCountControllerTests
{
    private readonly Mock<IMasterCountService> _serviceMock;
    private readonly Mock<ILogger<MasterCountController>> _loggerMock;
    private readonly MasterCountController _controller;

    public MasterCountControllerTests()
    {
        _serviceMock = new Mock<IMasterCountService>();
        _loggerMock = new Mock<ILogger<MasterCountController>>();

        _controller = new MasterCountController(
            _serviceMock.Object,
            _loggerMock.Object);
    }

    [Fact]
    public async Task Customers_ReturnsOk_WithCount()
    {
        _serviceMock
            .Setup(x => x.CountCustomersAsync(true))
            .ReturnsAsync(55);

        var result = await _controller.Customers(true);

        var ok = Assert.IsType<OkObjectResult>(result);

        var response = Assert.IsType<ApiResponse<int>>(ok.Value);

        Assert.True(response.Success);
        Assert.Equal("Customer count retrieved successfully", response.Message);
        Assert.Equal(55, response.Data);

        _serviceMock.Verify(x => x.CountCustomersAsync(true), Times.Once);
    }

    [Fact]
    public async Task Customers_Returns500_WhenServiceThrows()
    {
        _serviceMock
            .Setup(x => x.CountCustomersAsync(null))
            .ThrowsAsync(new Exception("boom"));

        var result = await _controller.Customers(null);

        var obj = Assert.IsType<ObjectResult>(result);
        Assert.Equal(StatusCodes.Status500InternalServerError, obj.StatusCode);

        var response = Assert.IsType<ApiResponse<string>>(obj.Value);
        Assert.False(response.Success);
        Assert.Equal("Error retrieving customer count", response.Message);
        Assert.NotNull(response.Error);
        Assert.Equal("500", response.Error.Code);
    }

    [Fact]
    public async Task CustomersByCity_ReturnsOk_WithGroups()
    {
        var groups = new[] { new CityCountDto("A", 2), new CityCountDto("B", 1) };

        _serviceMock
            .Setup(x => x.CountCustomersGroupedByCityAsync(null))
            .ReturnsAsync(groups);

        var result = await _controller.CustomersByCity(null);

        var ok = Assert.IsType<OkObjectResult>(result);
        var response = Assert.IsType<ApiResponse<IReadOnlyList<CityCountDto>>>(ok.Value);

        Assert.True(response.Success);
        Assert.Equal("Customer counts by city retrieved successfully", response.Message);
        Assert.Equal(2, response.Data.Count);

        _serviceMock.Verify(x => x.CountCustomersGroupedByCityAsync(null), Times.Once);
    }

    [Fact]
    public async Task Vendors_ReturnsOk_WithCount()
    {
        _serviceMock
            .Setup(x => x.CountVendorsAsync(false))
            .ReturnsAsync(7);

        var result = await _controller.Vendors(false);

        var ok = Assert.IsType<OkObjectResult>(result);
        var response = Assert.IsType<ApiResponse<int>>(ok.Value);

        Assert.True(response.Success);
        Assert.Equal("Vendor count retrieved successfully", response.Message);
        Assert.Equal(7, response.Data);
    }

    [Fact]
    public async Task Categories_ReturnsOk_WithCount()
    {
        _serviceMock
            .Setup(x => x.CountCategoriesAsync(null))
            .ReturnsAsync(3);

        var result = await _controller.Categories(null);

        var ok = Assert.IsType<OkObjectResult>(result);
        var response = Assert.IsType<ApiResponse<int>>(ok.Value);

        Assert.True(response.Success);
        Assert.Equal("Category count retrieved successfully", response.Message);
        Assert.Equal(3, response.Data);
    }

    [Fact]
    public async Task Items_ReturnsOk_WithCount()
    {
        _serviceMock
            .Setup(x => x.CountItemsAsync(5, true))
            .ReturnsAsync(99);

        var result = await _controller.Items(5, true);

        var ok = Assert.IsType<OkObjectResult>(result);
        var response = Assert.IsType<ApiResponse<int>>(ok.Value);

        Assert.True(response.Success);
        Assert.Equal("Item count retrieved successfully", response.Message);
        Assert.Equal(99, response.Data);
    }

    [Fact]
    public async Task Items_Returns500_WhenServiceThrows()
    {
        _serviceMock
            .Setup(x => x.CountItemsAsync(null, null))
            .ThrowsAsync(new Exception("err"));

        var result = await _controller.Items(null, null);

        var obj = Assert.IsType<ObjectResult>(result);
        Assert.Equal(StatusCodes.Status500InternalServerError, obj.StatusCode);

        var response = Assert.IsType<ApiResponse<string>>(obj.Value);
        Assert.False(response.Success);
        Assert.Equal("Error retrieving item count", response.Message);
    }
}
