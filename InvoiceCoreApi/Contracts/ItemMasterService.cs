using InvoiceCoreAPI.DTO;
namespace InvoiceCoreAPI.Contracts

{

    public interface IItemMasterService

    {

        Task<int> AddAsync(ItemMasterDto dto);

        Task<IEnumerable<ItemMasterDto>> GetAllAsync();

        Task<ItemMasterDto?> GetByIdAsync(int id);

        Task<bool> UpdateAsync(ItemMasterDto dto);

        Task<bool> DeleteAsync(int id);

    }

}

