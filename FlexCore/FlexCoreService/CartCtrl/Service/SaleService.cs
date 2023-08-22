using FlexCoreService.CartCtrl.Interface;

namespace FlexCoreService.CartCtrl.Service
{
	public class SaleService
	{
		private ISaleRepository _repo;
		public SaleService(ISaleRepository repo)
		{
			_repo = repo;
		}
	}
}
