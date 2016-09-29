namespace Clinic.DataLayer.DbLayer
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Employeer
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Employeer()
        {
            EmpInCabinets = new HashSet<EmpInCabinet>();
        }

        [Key]
        public int EmpId { get; set; }

        [Required]
        [StringLength(128)]
        public string EmpName { get; set; }

        public int UserId { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EmpInCabinet> EmpInCabinets { get; set; }

        public virtual User User { get; set; }
    }
}
