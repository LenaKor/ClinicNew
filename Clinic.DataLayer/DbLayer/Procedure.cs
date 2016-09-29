namespace Clinic.DataLayer.DbLayer
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Procedure
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Procedure()
        {
            ClientOnProcs = new HashSet<ClientOnProc>();
            ProcInCabinets = new HashSet<ProcInCabinet>();
        }

        [Key]
        public int ProcId { get; set; }

        [Required]
        [StringLength(64)]
        public string ProcName { get; set; }

        public TimeSpan? ProcDuration { get; set; }

        [Required]
        [StringLength(128)]
        public string ProcDescription { get; set; }

        [Column(TypeName = "money")]
        public decimal ProcCost { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ClientOnProc> ClientOnProcs { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProcInCabinet> ProcInCabinets { get; set; }
    }
}
