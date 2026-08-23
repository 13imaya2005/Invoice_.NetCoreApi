using InvoiceCoreApi.DTO;
using InvoiceCoreAPI.Entities;
namespace InvoiceCoreAPI.Contracts;

public interface IUsersRepository

{


    Task<IEnumerable<Users>> GetAllAsync();
    Task<Users?> GetByIdAsync(int id);
    Task<Users?> GetByUserNameAsync(string userName);
    Task<Users?> GetByEmailAsync(string email);
    Task<int> AddAsync(Users user);
    Task<bool> UpdateAsync(int id, Users user);
    Task<bool> DeleteAsync(int id);
    Task<PagedResultDto<Users>> GetAllPagedAsync(UsersFilterDto filter);
    Task<bool> UpdateLastLoginAsync(int id);

}

    
   