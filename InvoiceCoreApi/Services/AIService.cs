using InvoiceCoreApi.Contracts;
using InvoiceCoreApi.Models.AI;
using InvoiceCoreApi.Services;
using InvoiceCoreAPI.Contracts;
using System.Text.Json;

namespace InvoiceCoreAPI.Services;

public class AIService : IAIService

{

    private readonly ILogger<AIService> _logger;

    private readonly ICategoryRepository _categoryRepository;

    private readonly IMockAIProvider _mockAIProvider;

    public AIService(

        ILogger<AIService> logger,

        ICategoryRepository categoryRepository,

        IMockAIProvider mockAIProvider)

    {

        _logger = logger;

        _categoryRepository = categoryRepository;

        _mockAIProvider = mockAIProvider;

    }

    public async Task<AIAskResponse> AskAsync(

        AIAskRequest request)

    {

        _logger.LogInformation(

            "Processing AI question: {Question}",

            request.Question);

        var intentJson =

            await _mockAIProvider.GetIntentAsync(

                request.Question);

        _logger.LogInformation(

            "Intent received from Mock LLM: {Intent}",

            intentJson);

        var intent =

            JsonSerializer.Deserialize<AIIntent>(

                intentJson,

                new JsonSerializerOptions

                {

                    PropertyNameCaseInsensitive = true

                });

        if (intent == null)

        {

            throw new InvalidOperationException(

                "Unable to understand AI intent.");

        }

        if (!string.Equals(

                intent.Intent,

                "CategoryItemCount",

                StringComparison.OrdinalIgnoreCase))

        {

            return new AIAskResponse

            {

                Answer =

                    "I don't currently support that type of business question."

            };

        }

        if (string.IsNullOrWhiteSpace(

                intent.CategoryName))

        {

            return new AIAskResponse

            {

                Answer =

                    "I could not identify the category from your question."

            };

        }

        var categories =

            await _categoryRepository.GetAllAsync();

        var requestedCategoryName =

            intent.CategoryName.Trim();

        var category =

            categories.FirstOrDefault(

                x => !string.IsNullOrWhiteSpace(x.Name) &&

                     string.Equals(

                         x.Name.Trim(),

                         requestedCategoryName,

                         StringComparison.OrdinalIgnoreCase));

        if (category == null)

        {

            return new AIAskResponse

            {

                Answer =

                    $"I could not find the category '{intent.CategoryName}'."

            };

        }

        if (intent.CategoryActiveOnly == true &&

            category.IsActive != true)

        {

            return new AIAskResponse

            {

                Answer =

                    $"The category '{category.Name}' is currently inactive."

            };

        }

        var result =

            await _categoryRepository

                .GetCategoryItemCountAsync(

                    category.Name.Trim(),

                    intent.CategoryActiveOnly ?? false,

                    intent.ItemActiveOnly);

        if (result == null)

        {

            return new AIAskResponse

            {

                Answer =

                    $"I could not retrieve item information for the category '{category.Name}'."

            };

        }

        _logger.LogInformation(

            "Database result - Category: {Category}, ItemActiveOnly: {ItemActiveOnly}, Count: {Count}",

            result.CategoryName,

            intent.ItemActiveOnly,

            result.ItemCount);

        var cleanCategoryName =

            category.Name.Trim();

        string itemDescription;

        if (intent.ItemActiveOnly == true)

        {

            itemDescription = "active items";

        }

        else if (intent.ItemActiveOnly == false)

        {

            itemDescription = "inactive items";

        }

        else

        {

            itemDescription = "items";

        }

        var answer =

            $"The {cleanCategoryName} category is active and has {result.ItemCount} {itemDescription}.";

        return new AIAskResponse

        {

            Answer = answer

        };

    }

}

