namespace FlexCoreService.ActivityCtrl.Models.Dtos
{
    public class ReservationAddOrderDTO
    {
       public int memberId { get; set; }
       public string speakerName { get; set; }
       public string branchAddress { get; set; }
       public DateTime startTime { get; set; }
    }
}
