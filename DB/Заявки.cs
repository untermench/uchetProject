//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace uchetProject.DB
{
    using System;
    using System.Collections.Generic;
    
    public partial class Заявки
    {
        public int ID { get; set; }
        public string ФИО { get; set; }
        public System.DateTime Дата_рождения { get; set; }
        public string Место_обучения { get; set; }
        public int ID_Специальность { get; set; }
        public double Аттестат { get; set; }
        public string Номер { get; set; }
        public string Почта { get; set; }
        public Nullable<int> ID_Статус { get; set; }
    
        public virtual Специальность Специальность { get; set; }
        public virtual Статус_заявки Статус_заявки { get; set; }
    }
}
