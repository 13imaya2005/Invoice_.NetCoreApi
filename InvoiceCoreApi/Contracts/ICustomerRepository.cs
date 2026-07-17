using InvoiceCoreApi.DTO;
using InvoiceCoreAPI.DTO;

using InvoiceCoreAPI.Entities;

namespace InvoiceCoreAPI.Contracts;

public interface ICustomerRepoitory

{

    Task<int> AddAsync(Customer Customer);

    Task<IEnumerable<Customer>> GetAllAsync();

    Task<Customer?> GetByIdAsync(int id);

    Task<bool> UpdateAsync(Customer Customer);

    Task<bool> DeleteAsync(int id);

    Task<PagedResultDto<Customer>> GetAllPagedAsync(

    string? CustomerCode,

    string? CustomerName,

    bool?IsActive,

    int pageNumber,

    int pageSize);

}

