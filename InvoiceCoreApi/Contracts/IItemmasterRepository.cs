using InvoiceCoreApi.DTO;
using InvoiceCoreAPI.Entities;
using ProductApi.DTOs;

namespace InvoiceCoreAPI.Contracts;

public interface IItemmasterRepository
{
    Task<int> AddAsync(Itemmaster itemmaster);
    Task<IEnumerable<Itemmaster>> GetAllAsync();
    Task<Itemmaster?> GetByIdAsync(int id);
    Task<bool> UpdateAsync(Itemmaster itemmaster);
    Task<bool> DeleteAsync(int id);
    Task<PagedResultDto<Itemmaster>> GetAllPagedAsync(
    ItemmasterFilterDto search);
}
