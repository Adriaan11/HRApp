//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EngineeringClubHR
{
    using System;
    using System.Collections.Generic;
    
    public partial class Grievance
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Grievance()
        {
            this.GrievanceActions = new HashSet<GrievanceAction>();
        }
    
        public int GrievanceID { get; set; }
        public Nullable<int> EmployeeID { get; set; }
        public string GrievanceDescription { get; set; }
        public Nullable<System.DateTime> SubmissionDate { get; set; }
        public Nullable<int> StatusID { get; set; }
        public int PerpetratorID { get; set; }
        public string GrievanceTitle { get; set; }
        public bool IsActive { get; set; }
    
        public virtual Employee Employee { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<GrievanceAction> GrievanceActions { get; set; }
        public virtual GrievanceStatu GrievanceStatu { get; set; }
    }
}
