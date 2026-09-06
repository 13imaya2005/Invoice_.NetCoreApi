using InvoiceCoreApi.Models.AI;

namespace InvoiceCoreApi.Contracts
{
    public interface IAIService
    {
        Task<AIAskResponse> AskAsync(AIAskRequest request);
    }
}
