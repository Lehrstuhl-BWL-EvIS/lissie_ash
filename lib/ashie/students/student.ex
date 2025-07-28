defmodule Ashie.Students.Student do
  use Ash.Resource, otp_app: :ashie, domain: Ashie.Students, data_layer: AshPostgres.DataLayer

  postgres do
    table "students"
    repo Ashie.Repo
  end

  attributes do
    attribute :student_id, :string do
      primary_key? true
      allow_nil? false
      sensitive? true
      public? false
      constraints min_length: 4, max_length: 252
    end

    attribute :firstname, :string do
      allow_nil? false
      sensitive? true
      public? false
      constraints min_length: 1, max_length: 252
    end

    attribute :lastname, :string do
      allow_nil? false
      sensitive? true
      public? false
      constraints min_length: 1, max_length: 252
    end

    timestamps()
  end

  identities do
    identity :unique_student_id, [:student_id]
    identity :unique_student_id_name, [:student_id, :firstname, :lastname]
  end
end
