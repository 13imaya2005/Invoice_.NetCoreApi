using Invoice.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Invoice.BAL.Contracts
{
    public interface ICustomerService
    {
        Task<int> AddAsync(CustomerDto dto);
        Task<IEnumerable<CustomerDto>> GetAllAsync();
        Task<CustomerDto?> GetByIdAsync(int id);
        Task<bool> UpdateAsync(CustomerDto dto);
        Task<bool> DeleteAsync(int id);
        Task<PagedResultDto<CustomerDto>> GetAllPagedAsync(
 string? CustomerCode,

string? CustomerName,

bool? IsActive,

int pageNumber,

int pageSize);

    }
}
