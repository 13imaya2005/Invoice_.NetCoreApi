using Invoice.Data.Entities;
using Invoice.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Invoice.DAL.Repositories
{
    public interface ICustomerRepoitory

    {
        Task<int> AddAsync(Customer entity);
        Task<IEnumerable<Customer>> GetAllAsync();
        Task<Customer?> GetByIdAsync(int id);
        Task<bool> UpdateAsync(Customer entity);
        Task<bool> DeleteAsync(int id);
        Task<PagedResultDto<Customer>> GetAllPagedAsync(

        string? CustomerCode,

        string? CustomerName,

        bool? IsActive,

        int pageNumber,

        int pageSize);

    }


}
