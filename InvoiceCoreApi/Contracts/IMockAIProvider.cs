namespace InvoiceCoreApi.Contracts
{
    public interface IMockAIProvider
    {
        Task<string> GetIntentAsync(string question);
    }
}
