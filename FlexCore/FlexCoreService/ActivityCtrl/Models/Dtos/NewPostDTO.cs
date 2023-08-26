namespace FlexCoreService.ActivityCtrl.Models.Dtos
{
    public class NewPostDTO
    {
        public string Category { get; set; }
        public string Content { get; set; }
        public string Title { get; set; }
        public string Author { get; set; }
        public DateTime PublishTime { get; set; }
    }
}
