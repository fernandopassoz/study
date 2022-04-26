defmodule MuseWeb.MusicView do
  use MuseWeb, :view

  def render("create.json", %{music: music}) do
    %{
      music: music
    }
  end
end
