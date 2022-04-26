defmodule Muse.Music do
  def create("ok") do
    {:ok, %{message: "Welcome to the api", status: true}}
  end

  def create("error") do
    {:error, %{message: "Error while creating music", status: false}}
  end
end
