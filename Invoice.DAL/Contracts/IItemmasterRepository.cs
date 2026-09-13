using Invoice.Data.Entities;
using Invoice.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Invoice.DAL.Contracts
{
    public interface IItemmasterRepository
    {
        public interface IItemmasterRepository
        {
            Task<int> AddAsync(ItemmasterEntity entity);
            Task<IEnumerable<ItemmasterEntity>> GetAllAsync();
            Task<ItemmasterEntity?> GetByIdAsync(int id);
            Task<bool> UpdateAsync(ItemmasterEntity entity);
            Task<bool> DeleteAsync(int id);
            Task<PagedResultDto<ItemmasterEntity>> GetAllPagedAsync(
                ItemmasterFilterDto search);
        }

    }
}

