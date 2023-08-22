namespace FlexCoreService.ActivityCtrl.Models.Dtos
{
    public class TopThreeSpeakerDTO
    {
        public int fk_ReservationSpeakerId { get; set; }
        public string SpeakerName { get; set; }
        public string SpeakerImg { get; set; }
        public string FieldName { get; set; }
        public string BranchName { get; set; }
        public int TotalReservation { get; set; }
    }
}
