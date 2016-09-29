namespace Clinic.DataLayer.DbLayer
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Client
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Client()
        {
            ClientOnProcs = new HashSet<ClientOnProc>();
        }

        public int ClientId { get; set; }

        [Required]
        [StringLength(128)]
        public string ClientName { get; set; }

        [Required]
        [StringLength(128)]
        public string ClientLastName { get; set; }

        [Required]
        [StringLength(64)]
        public string ClientAddress { get; set; }

        [Column(TypeName = "date")]
        public DateTime ClientDataBirthday { get; set; }

        [StringLength(64)]
        public string ClientPhone { get; set; }

        [StringLength(64)]
        public string ClientEmail { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ClientOnProc> ClientOnProcs { get; set; }
    }
}
