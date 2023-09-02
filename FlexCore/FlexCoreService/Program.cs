using EFModels.Models;
using FlexCoreService.ActivityCtrl.Infra.DPRepository;
using FlexCoreService.ActivityCtrl.Interface;
using FlexCoreService.CartCtrl.Infra.Dapper;
using FlexCoreService.CartCtrl.Infra.EntityFramework;
using FlexCoreService.CartCtrl.Interface;
using FlexCoreService.CartCtrl.Service;
using FlexCoreService.Controllers;
using FlexCoreService.CustomeShoes.Infra.DPRepository;
using FlexCoreService.CustomeShoes.Interface;
using FlexCoreService.ProductCtrl.Infra.DPRepository;
using FlexCoreService.ProductCtrl.Interface;
using FlexCoreService.UserCtrl.Infa.DPRepository;
using FlexCoreService.UserCtrl.Interface;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc.Authorization;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using Microsoft.EntityFrameworkCore;

namespace FlexCoreService
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the DI container.

            builder.Services.AddControllers();

            builder.Services.AddDbContext<AppDbContext>
            (
                options => options.UseSqlServer(builder.Configuration.GetConnectionString("AppDbContext"))
            );

            //CORS?�放
            string MyAllow = "AllowAny";
            builder.Services.AddCors(options =>
            {
                options.AddPolicy(
                    name: MyAllow, policy => policy.WithOrigins("https://localhost:8080").AllowAnyHeader().AllowAnyMethod().AllowCredentials()
                );
            });

            //DI注入Dapper
            builder.Services.AddScoped<IProductRepository, ProductDPRepository>();
            builder.Services.AddScoped<ICategoryRepository, CategoryDPRepository>();
            builder.Services.AddScoped<IActivityDPRepository, ActivityDPRepository>();
            builder.Services.AddScoped<ActivityDPRepository>();
            builder.Services.AddScoped<CustomeShoesDPRepository>();
            builder.Services.AddScoped<ICustomeShoesRepository, CustomeShoesDPRepository>();
			builder.Services.AddScoped<ICartRepository, CartDapperRepository>();
			builder.Services.AddScoped<CartService>();
			builder.Services.AddScoped<CartController>();
			builder.Services.AddScoped<ISaleRepository, SaleEFRepository>();
			builder.Services.AddScoped<SaleService>();
			builder.Services.AddScoped<UsersController>();
			builder.Services.AddScoped<IShoesCategoryRepository, ShoesCategoryDPRepository>();
            builder.Services.AddScoped<ICustomerChooseRepository, ShoesChooseDPRepository>();
            builder.Services.AddScoped<IReservationDPRepository, ReservationDPRepositorycs>();
            builder.Services.AddScoped<IFavoriteDPRepository, FavoriteDPRepository>();
            builder.Services.AddScoped<PaymentDPRepository>();
            builder.Services.AddScoped<ICommunityRepository, CommunityRespository>();


            builder.Services.AddHttpContextAccessor();



            builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme).AddCookie(option =>
            {
                //���n�J�ɷ|�۰ʾɦV���}
                //option.LoginPath = new PathString("/api/Users/NoLogin");

                option.ExpireTimeSpan = TimeSpan.FromMinutes(5);
            });

            //����]�w�n�J����
            //builder.Services.AddMvc(options =>
            //{
            //    options.Filters.Add(new AuthorizeFilter());
            //});

            //Learn more about configuring Swagger / OpenAPI at https://aka.ms/aspnetcore/swashbuckle
            builder.Services.AddEndpointsApiExplorer();
            builder.Services.AddSwaggerGen();

			builder.Services.AddSingleton<WebSocketController>();

			var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (app.Environment.IsDevelopment())
            {
                app.UseSwagger();
                app.UseSwaggerUI();
            }

            app.UseCors();

            //app.UseRouting();

            app.UseCookiePolicy();
            app.UseAuthentication();
            app.UseAuthorization();

			app.UseWebSockets(new WebSocketOptions
			{
				KeepAliveInterval = TimeSpan.FromSeconds(30)
			});

			app.UseStaticFiles();

            app.UseHttpsRedirection();



            app.MapControllers();

            app.Run();
        }
    }
}