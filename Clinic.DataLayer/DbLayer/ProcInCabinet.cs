namespace Clinic.DataLayer.DbLayer
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ProcInCabinet
    {
        [Key]
        public int ProcInCabId { get; set; }

        public int ProcId { get; set; }

        public int CabinetId { get; set; }

        public virtual Cabinet Cabinet { get; set; }

        public virtual Procedure Procedure { get; set; }
    }
}
