namespace FlexCoreService.UserCtrl.Infa
{
    public class Result
    {
        public bool IsSuccess { get; private set; }
        public bool IsFail => !IsSuccess;

        public string ErrorMessage { get; private set; }

        public static Result Success() => new Result { IsSuccess = true, ErrorMessage = null };

        public static Result Fail(string errorMessage)
            => new Result { IsSuccess = false, ErrorMessage = errorMessage };
    }
}
