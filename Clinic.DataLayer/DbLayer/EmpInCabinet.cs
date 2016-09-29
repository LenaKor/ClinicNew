namespace Clinic.DataLayer.DbLayer
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class EmpInCabinet
    {
        [Key]
        public int EmpInCabinetsId { get; set; }

        public int EmpId { get; set; }

        public int CabinetId { get; set; }

        public virtual Cabinet Cabinet { get; set; }

        public virtual Employeer Employeer { get; set; }
    }
}
