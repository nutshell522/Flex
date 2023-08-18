namespace FlexCoreService.Orders
{
	public class commitVM
	{
		public int ProductId { get; set; }
		public int MemberID { get; set; }
		public string Description { get; set; }
		public int Score { get; set; }
		public bool status { get; set; }
		public DateTime CreateTime { get; set; }
	}
}
