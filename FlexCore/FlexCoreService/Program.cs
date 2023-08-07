using EFModels.Models;
using FlexCoreService.ActivityCtrl.Infra.DPRepository;
using FlexCoreService.ActivityCtrl.Interface;
using FlexCoreService.CartCtrl.Infra;
using FlexCoreService.CartCtrl.Interface;
using FlexCoreService.CustomeShoes.Infra.DPRepository;
using FlexCoreService.CustomeShoes.Interface;
using FlexCoreService.ProductCtrl.Infra.DPRepository;
using FlexCoreService.ProductCtrl.Interface;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc.Authorization;
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

            //CORS�}��
            string MyAllow = "AllowAny";
            builder.Services.AddCors(options =>
            {
                options.AddPolicy(
                    name: MyAllow, policy => policy.AllowAnyOrigin().AllowAnyHeader().AllowAnyMethod()
                );
            });

            //DI�`�JDapper
            builder.Services.AddScoped<IProductRepository, ProductDPRepository>();
            builder.Services.AddScoped<ICategoryRepository, CategoryDPRepository>();
            builder.Services.AddScoped<IActivityDPRepository, ActivityDPRepository>();
            builder.Services.AddScoped<ActivityDPRepository>();
			builder.Services.AddScoped<ICustomeShoesRepository, CustomeShoesDPRepository>();
			builder.Services.AddScoped<ICartRepository, CartDapperRepository>();
            builder.Services.AddScoped<IShoesCategoryRepository, ShoesCategoryDPRepository>();
            
            //DI�`�J��������
            builder.Services.AddHttpContextAccessor();

            
            //�ϥ�Cookie
            builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme).AddCookie(option =>
            {
                //���n�J�ɷ|�۰ʾɦV���}
               // option.LoginPath = new PathString("/api/Users/NoLogin");

                //�n�J�ɮ�
                option.ExpireTimeSpan= TimeSpan.FromMinutes(5);
            });

            //����]�w�n�J����
            builder.Services.AddMvc(options =>
            {
                options.Filters.Add(new AuthorizeFilter());
            });

			// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
			builder.Services.AddEndpointsApiExplorer();
            builder.Services.AddSwaggerGen();

            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (app.Environment.IsDevelopment())
            {
                app.UseSwagger();
                app.UseSwaggerUI();
            }

            app.UseCors();

            //�ϥΪ̵n�J����
            app.UseCookiePolicy();
            app.UseAuthentication();
            app.UseAuthorization();

            app.UseStaticFiles();

            app.UseHttpsRedirection();

            app.UseAuthorization();


            app.MapControllers();

            app.Run();
        }
    }
}