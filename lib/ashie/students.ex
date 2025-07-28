defmodule Ashie.Students do
  use Ash.Domain,
    otp_app: :ashie

  resources do
    resource Ashie.Students.Student
  end
end
