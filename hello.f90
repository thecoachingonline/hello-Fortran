module lattice_cryptography

! Declare the lattice parameters
integer, parameter :: n = 4096
integer, parameter :: d = 128
real(kind=8), parameter :: lambda = 1.0

! Define the lattice basis
real(kind=8), dimension(n) :: basis
basis = reshape([1.0, 2.0, 3.0], (/n/))

! Define the message to be encrypted
character(len=10) :: message = "สวัสดีชาวโลก"

! Convert the message to a lattice point
integer :: message_point(n)
do i = 1, n
  message_point(i) = ord(message(i))
end do

! Generate the encryption key
real(kind=8) :: encryption_key
encryption_key = random(0.0, 1.0)

! Encrypt the message
real(kind=8) :: ciphertext(n)
ciphertext = message_point + encryption_key * basis

! Print the ciphertext
print *, ciphertext

end module

program main

use lattice_cryptography

! Declare the variables
real(kind=8) :: decryption_key
integer :: decrypted_message_point(n)
character(len=10) :: decrypted_message

! Get the decryption key from the user
print *, "Enter the decryption key: "
read *, decryption_key

! Decrypt the ciphertext
decrypted_message_point = ciphertext - decryption_key * basis

! Convert the decrypted message point to a string
decrypted_message = ""
do i = 1, n
  decrypted_message = decrypted_message // chr(decrypted_message_point(i))
end do

! Print the decrypted message
print *, decrypted_message

end program