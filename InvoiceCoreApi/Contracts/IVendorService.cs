using InvoiceCoreApi.DTO;
using InvoiceCoreAPI.DTO;

namespace InvoiceCoreAPI.Contracts
{
    public interface IVendorService
    {
        Task<int> AddAsync(VendorDto vendor);

        Task<IEnumerable<VendorDto>> GetAllAsync();

        Task<VendorDto?> GetByIdAsync(int id);

        Task<bool> UpdateAsync(VendorDto vendor);

        Task<bool> DeleteAsync(int id);

        Task<PagedResultDto<VendorDto>> GetAllPagedAsync(
            string? VendorCode,
            string? VendorName,
            string? ContactPerson,
            string? MobileNo,
            string? Email,
            string? City,
            bool? IsActive,
            int pageNumber,
            int pageSize);
    }
}