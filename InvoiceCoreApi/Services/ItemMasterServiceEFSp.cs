
using AutoMapper;
using InvoiceCoreApi.DTO;
using InvoiceCoreAPI.Contracts;
using InvoiceCoreAPI.Controllers;
using InvoiceCoreAPI.DTO;
using InvoiceCoreAPI.Entities;
using ProductApi.DTOs;

namespace InvoiceAPI.Services;

public class ItemMasterServiceEFSp : IItemMasterService
{
    private readonly IItemmasterRepository _repository;
    private readonly IMapper _mapper;

    private readonly ILogger<ItemMasterServiceEFSp> _logger;
    public ItemMasterServiceEFSp(IItemmasterRepository repository, IMapper mapper, ILogger<ItemMasterServiceEFSp> logger)
    {
        _repository = repository;
        _mapper = mapper;
        _logger = logger;
    }
    public async Task<int> AddAsync(ItemMasterDto dto)
    {
        var entity = _mapper.Map<Itemmaster>(dto);
        return await _repository.AddAsync(entity);
    }
    public async Task<IEnumerable<ItemMasterDto>> GetAllAsync()
    {
        var items = await _repository.GetAllAsync();
        return _mapper.Map<IEnumerable<ItemMasterDto>>(items);
    }
    public async Task<ItemMasterDto?> GetByIdAsync(int id)
    {
        var item = await _repository.GetByIdAsync(id);
        return item == null ? null : _mapper.Map<ItemMasterDto>(item);
    }
    public async Task<bool> UpdateAsync(ItemMasterDto dto)
    {
        var entity = _mapper.Map<Itemmaster>(dto);
        return await _repository.UpdateAsync(entity);
    }
    public async Task<bool> DeleteAsync(int id)
    {
        return await _repository.DeleteAsync(id);
    }
    public async Task<PagedResultDto<ItemMasterDto>> GetAllPagedAsync(
        ItemmasterFilterDto search)

      
    {
        _logger.LogInformation("ItemsMaster Service GetAllPaged Async Method Called");
        _logger.LogInformation("");
        var result = await _repository.GetAllPagedAsync(search);

        return new PagedResultDto<ItemMasterDto>
        {
            Data = _mapper.Map<IEnumerable<ItemMasterDto>>(result.Data),
            TotalRecords = result.TotalRecords
        };
    }
}
    
