# Carspot Website

**Carspot** is a Ruby on Rails Application use to rent a car.

Submitted by: **Trung (Group4)**
Editted by: **Trinh (Group4)**

Wireframing: **https://app.moqups.com/phhtrinh/uZqOAY2BP4/edit/page/ad64222d5**

## User Stories
* [ ] As user I can sign up by providing their email, password, and name.
* [ ] As user I can login using an email and password.
* [ ] As login user I can update profile such as name, avatar, email, password
* [ ] As login user I can see profile of other users
* [ ] As login user I can view my cars
    * [ ] Search by model, license plate
    * [ ] *Filter by year, branch, chassi, car status, from/to date*
    * [ ] *Order by model, base price, car status, date*
    * [ ] Item must have:
        * [ ] Car image
        * [ ] Car status: Publish/Unpuplish
        * [ ] The car is renting or not
        * [ ] No of Waiting request
        * [ ] Car info: model, license plate, year, branch, chassi, date
        * [ ] Rent setting: base price, driver price, service options price
        * [ ] *Vote info*
    * [ ] Register the car for rent
        * [ ] Input car info
            * Upload car images - max 4 images
            * Model: Mazda 6 Sport
            * License plate: 83F6-8472
            * Year: 2017
            * Branch: Mazda
            * Chassi: Sedan, Station, Wagon, Hatchback, MPV, SUV, LCV
            * Engine: 1,496 cc
            * Horsepower: 184HP/5700rpm
            * Torque: 141Nm/3250rpm
            * Doors: 2, 3, 4, 5
            * Seats: 4, 5, 7
            * Transmission: Manual, Automatic
            * Fuel Type: Petrol, Diesel
            * Description
        * [ ] Input rent setting
            * [ ] Base price per day
            * [ ] Custom price from/to date
            * [ ] Driver price per day as a plugin service
            * [ ] Service options price such as: GPS tracking, Webding decorator ...
            * [ ] Note description when rent car
    * [ ] Update car info
    * [ ] Update rent setting
    * [ ] Publish/Unpublish car for rent
    * [ ] Delete car if don't have any rent histories
    * [ ] View car detail
        * [ ] Car Image: all image
        * [ ] Car status: Publish/Unpuplish
        * [ ] The car is renting or not with renter avatar
        * [ ] No of Waiting request
        * [ ] Car info
        * [ ] Rent setting
        * [ ] *Vote info*
        * [ ] *Car hisotries as timelife*
* [ ] As login user I can see my reviews
    * [ ] Search by model, license plate
    * [ ] *Filter by request status, from/to date*
    * [ ] *Order by model, license plate, base price, request status, date*
    * [ ] Item must have:
        * [ ] Renter info
        * [ ] Request status: Waiting/Approval/Control/Return
        * [ ] Car info: model, license plate, year, branch, chassi, date
        * [ ] Rent info: base price, driver price, service options price
        * [ ] List and input comment between onwer and renter
        * [ ] *Display warning if From Date of request smaller than current date for Waiting/Approval*
        * [ ] *Display warning if To Date of request smaller than current date for Control*
    * [ ] Change request status from Waiting to Approval with the comment for renter
    * [ ] Change request status from Approval to Control with the comment for renter
    * [ ] Change request status from Control to Return with the comment for renter
    * [ ] Change request status from Return to Confirm with the comment for renter => *after confirm the item will not in the list, the voter will be send to owner and renter*
    * [ ] Change request status from Request/Approval to Cancel with the comment for renter
* [ ] As user I can view publish cars from other users
    * [ ] Search by model, license plate
    * [ ] *Filter by year, branch, chassi, availabe car with from/to date*
    * [ ] *Order by model, base price, publish date*
    * [ ] Item must have:
        * [ ] Car image
        * [ ] The car is renting or not
        * [ ] No of Waiting request
        * [ ] Car info: model, license plate, year, branch, chassi, date
        * [ ] Rent setting: base price, driver price, service options price
        * [ ] *Vote info*
    * [ ] View car detail
        * [ ] Car Image: all image
        * [ ] The car is renting or not with renter avatar
        * [ ] No of Waiting request
        * [ ] Car info
        * [ ] Rent setting
        * [ ] *Vote info*
    * [ ] As login user I can make the request to rent car
        * [ ] Input Renter info
            * [ ] Fullname
            * [ ] Address
            * [ ] Phone
            * [ ] Passport or Identity Card:
                * Number
                * Image
            * [ ] Note
        * [ ] Can select from/to date availabe
            * [ ] Cannot select the date was booked with approval/control request
            * [ ] *Can see calendar with base/custom price for day*
        * [ ] Can select driver or not
        * [ ] Can select service options
        * [ ] Automatic calculate total price and display detail pricing from/to date with base price, custom price and plugin services

* [ ] As login user I can view my requests
    * [ ] Search by model, license plate
    * [ ] *Filter by request status, from/to date*
    * [ ] *Order by model, license plate, base price, request status, date*
    * [ ] Item must have:
        * [ ] Owner info: avatar, username
        * [ ] Renter info
        * [ ] Request status: Waiting/Approval/Control/Return/Confirm
        * [ ] Car info: model, license plate, year, branch, chassi, date
        * [ ] Rent info: base price, driver price, service options price
        * [ ] List and input comment between onwer and renter
        * [ ] *Display warning if From Date of request smaller than current date for Waiting/Approval*
        * [ ] *Display warning if To Date of request smaller than current date for Control*
    * [ ] Can update renter info if status is Waiting
    * [ ] Change request status from Waiting to Cancel with the comment for owner
    * [ ] Change request status from Approval to Cancel with the comment for owner
        * [ ] *Pay penalty fee*
    * [ ] Change request status from Control to Return with the comment for owner
### Optional:
* [ ] Integrate with facebook
    * [ ] Sign up
    * [ ] Login
    * [ ] Share car info
* [ ] Vote and review car after rent finish
* [ ] Add comment as Q&A for owner
* [ ] Integrate payment system to pay online
* [ ] Integrate point system to improve marketing
