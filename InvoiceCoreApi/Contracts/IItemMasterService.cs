using InvoiceCoreApi.DTO;
using InvoiceCoreAPI.DTO;
using ProductApi.DTOs;
namespace InvoiceCoreAPI.Contracts

{

    public interface IItemMasterService

    {

        Task<int> AddAsync(ItemMasterDto dto);

        Task<IEnumerable<ItemMasterDto>> GetAllAsync();

        Task<ItemMasterDto?> GetByIdAsync(int id);

        Task<bool> UpdateAsync(ItemMasterDto dto);

        Task<bool> DeleteAsync(int id);

        Task<PagedResultDto<ItemMasterDto>> GetAllPagedAsync(
ItemmasterFilterDto search);
    }

}

