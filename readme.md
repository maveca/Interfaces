# Interfaces

This allows for writing code that reduces the dependency on implementation details, makes it easier to reuse code, and supports a polymorphic way of calling object methods, which again can be used for substituting business logic.

The interface declares an interface name along with its methods, and codeunits that implement the interface methods, must use the implements keyword along with the interface name(s). The interface itself does not contain any code, only signatures, and cannot itself be called from code, but must be implemented by other objects.

## Interface Example

```c#
interface IAddressProvider
{
    procedure GetAddress(): Text
}
```

> See also [Shape](./src/GraphicalElements/Interface/IShape.Interface.al) interface.

## Implementing Interface

```c#
codeunit 50200 CompanyAddressProvider implements IAddressProvider
{
    procedure GetAddress(): Text
    begin
        exit('Company address \ Denmark 2800')
    end;
}

codeunit 50201 PrivateAddressProvider implements IAddressProvider
{
    procedure GetAddress(): Text
    begin
        exit('My Home address \ Denmark 2800')
    end;
}
```

> See also [Line of Shape](./src/GraphicalElements/Shapes/Line.Codeunit.al) implementation.

## Constructor

Actually we can't call this constructor because the object is constructed at the declaration point. But we still need to map implemented codeunit with the interface somewhere in order to use base interface independently.

```pas
procedure AddressFactory(var iAddressProvider: Interface AddressProvider)
var
    CompanyImplementer: Codeunit CompanyAddressProvider;
    PrivateImplementer: Codeunit PrivateAddressProvider;
begin
    if sendTo = sendTo::Company then
        iAddressProvider := CompanyImplementer;

    if sendTo = sendTo::Private then
        iAddressProvider := PrivateImplementer;
end;
```

> See also [Demo.Codeunit.al](./src/Code/Demo.Codeunit.al) file.
