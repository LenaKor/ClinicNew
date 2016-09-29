namespace Clinic.DataLayer.DbLayer
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class ClinicContext : DbContext
    {
        public ClinicContext()
            : base("name=ClinicContext")
        {
        }

        public virtual DbSet<Cabinet> Cabinets { get; set; }
        public virtual DbSet<ClientOnProc> ClientOnProcs { get; set; }
        public virtual DbSet<Client> Clients { get; set; }
        public virtual DbSet<EmpInCabinet> EmpInCabinets { get; set; }
        public virtual DbSet<Employeer> Employeers { get; set; }
        public virtual DbSet<Procedure> Procedures { get; set; }
        public virtual DbSet<ProcInCabinet> ProcInCabinets { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<UsersInRole> UsersInRoles { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Cabinet>()
                .HasMany(e => e.ClientOnProcs)
                .WithRequired(e => e.Cabinet)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Cabinet>()
                .HasMany(e => e.EmpInCabinets)
                .WithRequired(e => e.Cabinet)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Cabinet>()
                .HasMany(e => e.ProcInCabinets)
                .WithRequired(e => e.Cabinet)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Client>()
                .Property(e => e.ClientName)
                .IsUnicode(false);

            modelBuilder.Entity<Client>()
                .Property(e => e.ClientLastName)
                .IsUnicode(false);

            modelBuilder.Entity<Client>()
                .Property(e => e.ClientAddress)
                .IsUnicode(false);

            modelBuilder.Entity<Client>()
                .Property(e => e.ClientPhone)
                .IsUnicode(false);

            modelBuilder.Entity<Client>()
                .Property(e => e.ClientEmail)
                .IsUnicode(false);

            modelBuilder.Entity<Client>()
                .HasMany(e => e.ClientOnProcs)
                .WithRequired(e => e.Client)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Employeer>()
                .Property(e => e.EmpName)
                .IsUnicode(false);

            modelBuilder.Entity<Employeer>()
                .HasMany(e => e.EmpInCabinets)
                .WithRequired(e => e.Employeer)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Procedure>()
                .Property(e => e.ProcName)
                .IsUnicode(false);

            modelBuilder.Entity<Procedure>()
                .Property(e => e.ProcDescription)
                .IsUnicode(false);

            modelBuilder.Entity<Procedure>()
                .Property(e => e.ProcCost)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Procedure>()
                .HasMany(e => e.ClientOnProcs)
                .WithRequired(e => e.Procedure)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Procedure>()
                .HasMany(e => e.ProcInCabinets)
                .WithRequired(e => e.Procedure)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Role>()
                .Property(e => e.RoleName)
                .IsUnicode(false);

            modelBuilder.Entity<Role>()
                .HasMany(e => e.UsersInRoles)
                .WithRequired(e => e.Role)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<User>()
                .Property(e => e.UserName)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.UserPass)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .HasMany(e => e.Employeers)
                .WithRequired(e => e.User)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<User>()
                .HasMany(e => e.UsersInRoles)
                .WithRequired(e => e.User)
                .WillCascadeOnDelete(false);
        }
    }
}
