using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Automapper
{
    class Program
    {

        public class TestModelProfile : Profile
        {
            public TestModelProfile()
            {
                CreateMap<TestModel, TestTable>()
                 .ForMember(dest => dest.Name, opts => opts.MapFrom(source => source.UserName))
                 .ForMember(dest => dest.IsDeleted, opts => opts.UseValue<bool>(false));

                CreateMap<TestTable, TestModel>()
                .ForMember(dest => dest.UserName, opts => opts.MapFrom(source => source.Name));
            }
        }


        public class TestModelOwnProfile : Profile
        {
            public TestModelOwnProfile()
            {
                CreateMap<TestTable, TestTableOwn>()
                 .ForMember(dest => dest.MojeImie, opts => opts.MapFrom(source => source.Name))
                 .ForMember(dest => dest.Numer, opts => opts.UseValue<int>(123456789));

                CreateMap<TestTableOwn, TestTable>()
                .ForMember(dest => dest.Name, opts => opts.MapFrom(source => source.MojeImie))
                .ForMember(dest => dest.Phone, opts => opts.MapFrom(source => source.Numer))
                .ForMember(dest => dest.City, opts => opts.UseValue<string>("Krakow"))
                .ForMember(dest => dest.PostCode, opts => opts.UseValue<int>(12))
                .ForMember(dest => dest.Payment, opts => opts.UseValue<int>(123456))
                .ForMember(dest => dest.IsDeleted, opts => opts.UseValue<int>(1));
            }
        }





        static void Main(string[] args)
        {

            Mapper.Initialize(cfg =>
            {
                cfg.AddProfile<TestModelOwnProfile>();
            });


            TestTableOwn wlasne = new TestTableOwn();
            BazaSoftwarehutEntities baza = new BazaSoftwarehutEntities();

            var WartoscZTestTable = baza.TestTables.Where(x => x.Id == 1).Single();
          
            wlasne = Mapper.Map<TestTableOwn>(WartoscZTestTable);


            baza.TestTableOwns.Add(wlasne);


            Console.WriteLine(wlasne.MojeImie);

            baza.SaveChanges();




        }
    }
}
