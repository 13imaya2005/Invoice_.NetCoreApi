using InvoiceCoreApi.DTO;
using InvoiceCoreAPI.DTO;

namespace InvoiceCoreAPI.Contracts

{

    public interface ICustomerService

    {

        Task<int> AddAsync(CustomerDto customer);

        Task<IEnumerable<CustomerDto>> GetAllAsync();

        Task<CustomerDto?> GetByIdAsync(int id);

        Task<bool> UpdateAsync(CustomerDto customer);

        Task<bool> DeleteAsync(int id);

        Task<PagedResultDto<CustomerDto>> GetAllPagedAsync(

 string? CustomerCode,

string? CustomerName,

bool? IsActive,

int pageNumber,

int pageSize);

    }

}

