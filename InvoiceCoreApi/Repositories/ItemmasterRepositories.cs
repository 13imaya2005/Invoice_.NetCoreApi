using InvoiceCoreAPI.Contracts;

using InvoiceCoreAPI.Data;

using InvoiceCoreAPI.Entities;

using Microsoft.Data.SqlClient;

using Microsoft.EntityFrameworkCore;

namespace InvoiceCoreAPI.Repositories;

public class ItemmasterRepository : IItemmasterRepository

{

    private readonly AppDbContext _dbContext;

    public ItemmasterRepository(AppDbContext dbContext)

    {

        _dbContext = dbContext;

    }

    public async Task<int> AddAsync(Itemmaster itemmaster)

    {

        var result = await _dbContext.Database.ExecuteSqlRawAsync(

            @"EXEC sp_Itemmaster_Insert

            @CatCode,

            @ItemBarCode,

            @ItemCode,

            @ItemName,

            @Description,

            @Uom,

            @Rate,

            @Minimumstock,

            @Maximumstock,

            @IsActive",

            new SqlParameter("@CatCode", itemmaster.CatCode),

            new SqlParameter("@ItemBarCode", itemmaster.ItemBarCode),

            new SqlParameter("@Itemcode", itemmaster.ItemCode),

            new SqlParameter("@Itemname", itemmaster.ItemName),

            new SqlParameter("@Description", (object?)itemmaster.Description ?? DBNull.Value),

            new SqlParameter("@Uom", itemmaster.Uom),

            new SqlParameter("@Rate", (object?)itemmaster.Rate ?? DBNull.Value),

            new SqlParameter("@Minimumstock", (object?)itemmaster.MinimumStock ?? DBNull.Value),

            new SqlParameter("@Maximumstock", (object?)itemmaster.MaximumStock ?? DBNull.Value),

            new SqlParameter("@IsActive", (object?)itemmaster.IsActive ?? DBNull.Value)

            );

        return result;// returns affected rows

    }

    public async Task<bool> UpdateAsync(Itemmaster itemmaster)

    {

        var affectedRows = await _dbContext.Database.ExecuteSqlRawAsync(

            @"EXEC sp_Itemmaster_Update

            @Id,

            @CatCode,

            @ItemBarCode,

            @Itemcode,

            @Itemname,

            @Description,

            @Uom,

            @Rate,

            @Minimumstock,

            @Maximumstock,

            @IsActive",

            new SqlParameter("@Id", itemmaster.Id),

            new SqlParameter("@CatCode", itemmaster.CatCode),

            new SqlParameter("@ItemBarCode", itemmaster.ItemBarCode),

            new SqlParameter("@Itemcode", itemmaster.ItemCode),

            new SqlParameter("@Itemname", itemmaster.ItemName),

            new SqlParameter("Description", (object?)itemmaster.Description ?? DBNull.Value),

            new SqlParameter("@Uom", itemmaster.Uom),

            new SqlParameter("@Rate", (object?)itemmaster.Rate ?? DBNull.Value),

            new SqlParameter("@Minimumstock", (object?)itemmaster.MinimumStock ?? DBNull.Value),

            new SqlParameter("@Maximumstock", (object?)itemmaster.MaximumStock ?? DBNull.Value),

            new SqlParameter("@IsActive", (object?)itemmaster.IsActive ?? DBNull.Value),

            new SqlParameter("@Updatedby", (object?)itemmaster.UpdatedBy ?? DBNull.Value)

            );

        return affectedRows > 0;

    }

    public async Task<Itemmaster?> GetByIdAsync(int id)

    {

        var items = await _dbContext.Itemmasters

            .FromSqlRaw("EXEC sp_Itemmaster_GetById @Id",

            new SqlParameter("@Id",id ))

            .AsNoTracking()
            .ToListAsync();

            return items.FirstOrDefault();
    }

    

    public async Task<IEnumerable<Itemmaster>> GetAllAsync()

    {

        return await _dbContext.Itemmasters

            .FromSqlRaw("EXEC sp_Itemmaster_GetAll")

            .ToListAsync();

    }

    public async Task<bool> DeleteAsync(int id)

    {

        var affectedRows = await _dbContext.Database.ExecuteSqlRawAsync(

            "EXEC sp_Itemmaster_Delete @Id",

            new SqlParameter("@Id", id));

        return affectedRows > 0;

    }

}

