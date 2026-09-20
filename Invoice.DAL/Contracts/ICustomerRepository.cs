using Invoice.Data.Entities;
using Invoice.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Invoice.DAL.Repositories;

public interface ICustomerRepository

{
    Task<int> AddAsync(CustomerEntity entity);
    Task<IEnumerable<CustomerEntity>> GetAllAsync();
    Task<CustomerEntity?> GetByIdAsync(int id);
    Task<bool> UpdateAsync(CustomerEntity entity);
    Task<bool> DeleteAsync(int id);
    Task<PagedResultDto<CustomerEntity>> GetAllPagedAsync(

    string? CustomerCode,

    string? CustomerName,

    bool? IsActive,

    int pageNumber,

    int pageSize);

}
