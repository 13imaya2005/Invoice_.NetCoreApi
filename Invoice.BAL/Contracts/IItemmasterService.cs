using Invoice.DTOs;
using System;
using System.Collections.Generic;
using System.Text;

namespace Invoice.BAL.Contracts;

public interface IItemmasterService
{
    Task<int> AddAsync(ItemMasterDto dto);

    Task<IEnumerable<ItemMasterDto>> GetAllAsync();

    Task<ItemMasterDto?> GetByIdAsync(int id);

    Task<bool> UpdateAsync(ItemMasterDto dto);

    Task<bool> DeleteAsync(int id);

    Task<PagedResultDto<ItemMasterDto>> GetAllPagedAsync(
ItemmasterFilterDto search);
    Task<int> GetActiveItemCountByCategoryAsync(int categoryId);
}
