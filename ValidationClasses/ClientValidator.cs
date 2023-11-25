using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace EngineeringClubHR.ValidationClasses
{
    public class ClientValidator: AbstractValidator<Client>
    {
        public ClientValidator()
        {
            RuleFor(x => x.firstName).NotEmpty().WithMessage("First name cannot be empty");
            RuleFor(x => x.firstName).Must(ContainsOnlyLetters).WithMessage("First name can only contain letters");
            RuleFor(x => x.middleName).Must(ContainsOnlyLetters).WithMessage("Middle name can only contain letters");
            RuleFor(x => x.lastName).NotEmpty().WithMessage("Last name cannot be empty");
            RuleFor(x => x.lastName).Must(ContainsOnlyLetters).WithMessage("Last name can only contain letters");
            RuleFor(x => x.email).NotEmpty().WithMessage("Email cannot be empty");
            RuleFor(x => x.email).EmailAddress().WithMessage("Email must be a valid email address");
            RuleFor(x => x.phoneNumber).NotEmpty().WithMessage("Phone number cannot be empty");
            RuleFor(x => x.phoneNumber).Must(ContainsOnlyDigits).WithMessage("Phone number can only contain digits");
            RuleFor(x => x.address).NotEmpty().WithMessage("Address cannot be empty");
            RuleFor(x => x.city).NotEmpty().WithMessage("City cannot be empty");
            RuleFor(x => x.postalCode).NotEmpty().WithMessage("Postal code cannot be empty");
            RuleFor(x => x.country).NotEmpty().WithMessage("Country cannot be empty");
            RuleFor(x => x.state).NotEmpty().WithMessage("State cannot be empty");
            RuleFor(x => x.industry).NotEmpty().WithMessage("Industry cannot be empty");
            RuleFor(x => x.contactPerson).NotEmpty().WithMessage("Contact person cannot be empty");
            RuleFor(x => x.contactPersonEmail).NotEmpty().WithMessage("Contact person email cannot be empty");
            RuleFor(x => x.contactPersonEmail).EmailAddress().WithMessage("Contact person email must be a valid email address");
            RuleFor(x => x.contactPersonPhone).NotEmpty().WithMessage("Contact person phone cannot be empty");
            RuleFor(x => x.contactPersonPhone).Must(ContainsOnlyDigits).WithMessage("Contact person phone can only contain digits");
            RuleFor(x => x.organizationName).NotEmpty().WithMessage("Organization name cannot be empty");
            RuleFor(x => x.clientType).NotEmpty().WithMessage("Client type cannot be empty");
        }
        public static bool ContainsOnlyLetters(string input)
        {
            return Regex.IsMatch(input, @"^[A-Za-z]+$");
        }
        public static bool ContainsOnlyDigits(string input)
        {
            return Regex.IsMatch(input, @"^[0-9]+$");
        }
    }
}