namespace FlexCoreService.ActivityCtrl.Models.Dtos
{
    public class HistoryPostsDTO
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public DateTime PublishTime { get; set; }
        public string Author { get; set; }

        public string Category { get; set; }
        
    }
}
