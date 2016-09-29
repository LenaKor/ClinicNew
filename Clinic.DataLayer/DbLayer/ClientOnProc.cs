namespace Clinic.DataLayer.DbLayer
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ClientOnProc")]
    public partial class ClientOnProc
    {
        public int ClientOnProcId { get; set; }

        public int ProcId { get; set; }

        public int CabinetId { get; set; }

        public int ClientId { get; set; }

        public TimeSpan? StartTime { get; set; }

        public TimeSpan? FinishTime { get; set; }

        public virtual Cabinet Cabinet { get; set; }

        public virtual Client Client { get; set; }

        public virtual Procedure Procedure { get; set; }
    }
}
