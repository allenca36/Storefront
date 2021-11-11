using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace StoreFront.DATA.EF/*StoreFrontMetadata*/
{
    #region Department Metadata

    public class DepartmentMetaData
    {
        [Required(ErrorMessage = "*Department Name is required*")]
        [Display(Name = "Department Name")]
        public string DepartmentName { get; set; }
    }
    [MetadataType(typeof(DepartmentMetaData))]
    public partial class Department
    {

    }
    #endregion

    #region Employee Metadata
    public class EmployeeMetadata
    {
        [Required(ErrorMessage = "*First Name is required*")]
        public string FirstName { get; set; }
        [Required(ErrorMessage = "*Last Name is required*")]
        public string LastName { get; set; }
        [DisplayFormat(NullDisplayText = "[-N'A-]")]
        public Nullable<int> Role { get; set; }
        [DisplayFormat(NullDisplayText = "[-N'A-]", DataFormatString = "{0:c}")]
        public Nullable<decimal> Salary { get; set; }
        [DisplayFormat(NullDisplayText = "[-N'A-]", DataFormatString = "{0:d}")]
        public Nullable<System.DateTime> DateHired { get; set; }
        [DisplayFormat(NullDisplayText = "[-N'A-]")]
        public Nullable<int> DirectReportID { get; set; }
        [DisplayFormat(NullDisplayText = "[-N'A-]")]
        public Nullable<int> DepartmentID { get; set; }
    }
    [MetadataType(typeof(EmployeeMetadata))]
    public partial class Employee
    {

    }
    #endregion

    #region Product Metadata
    public class ProductMetadata
    {
        [Required(ErrorMessage = "*Product Name is required*")]
        [Display(Name = "Product Name")]
        public string ProductName { get; set; }
        [Required(ErrorMessage = "*Product Type is required*")]
        [Display(Name = "Category Name")]
        public int ProductType { get; set; }
        [Required(ErrorMessage = "*Price is required*")]
        [DisplayFormat(DataFormatString = "{0:c}")]
        public decimal Price { get; set; }
        public Nullable<int> UnitsSold { get; set; }
        [Required(ErrorMessage = "*Product Name is required*")]
        public int StatusID { get; set; }
        public string ProductImage { get; set; }
    }
    [MetadataType(typeof(ProductMetadata))]
    public partial class Product
    {

    }
    #endregion

    #region ProductType Metadata
    public class ProductTypeMetadata
    {

    }
    [MetadataType(typeof(ProductTypeMetadata))] 
    public partial class ProductType { }


    #endregion

    #region Role Metadata
    public class RoleMetadata
    {
        [Required(ErrorMessage = "*Role Name is required*")]
        [Display(Name = "Role Name")]
        public string RoleName { get; set; }
    }
    [MetadataType(typeof(RoleMetadata))]
    public partial class Role { }
    #endregion

    #region Status Metadata
    public class StatusMetadata
    {
        [Required(ErrorMessage = "*Status is required*")]
        public string StatusName { get; set; }
    }
    [MetadataType(typeof(StatusMetadata))]
    public partial class Status { }
    #endregion

    #region SubType Metadata
    public class SubTypeMetadata
    {
        [Required(ErrorMessage = "*SubType Name is required*")]
        [Display(Name = "SubType Name")]
        public string SubTypeName { get; set; }
    }
    [MetadataType(typeof(SubTypeMetadata))]
    public partial class SubType { }
    #endregion
}

