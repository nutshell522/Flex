using EFModels.Models;
using FlexCoreService.ActivityCtrl.Models.Dtos;
using FlexCoreService.ActivityCtrl.Models.VM;
using Microsoft.CodeAnalysis.CSharp.Syntax;

namespace FlexCoreService.ActivityCtrl.Exts
{
    public static class ReservationExts
    {
        public static SpeakerDetailVM ToDetailVM(this SpeakerDetailDTO dto)
        {
            return new SpeakerDetailVM
            {
                SpeakerId = dto.SpeakerId,
                SpeakerName = dto.SpeakerName,
                SpeakerDescription = dto.SpeakerDescription,
                SpeakerImg = dto.SpeakerImg,
                FieldName = dto.FieldName,
                BranchName = dto.BranchName,
                BranchAddress = dto.BranchAddress
            };
        }

        public static ReservationHistoryVM ToVM (this ReservationHistoryDTO dto)
        {
            return new ReservationHistoryVM
            {
                ReservationStartTime = dto.ReservationStartTime
            };
        }
    }
}
