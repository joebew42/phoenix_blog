defmodule PhoenixBlogWeb.ErrorHelpers do
  use Phoenix.HTML

  def error_tag(form, field) do
    Enum.map(Keyword.get_values(form.errors, field), fn (error) ->
      content_tag :div, translate_error(error), class: "ui pointing red basic label"
    end)
  end

  def translate_error({msg, opts}) do
    if count = opts[:count] do
      Gettext.dngettext(PhoenixBlogWeb.Gettext, "errors", msg, msg, count, opts)
    else
      Gettext.dgettext(PhoenixBlogWeb.Gettext, "errors", msg, opts)
    end
  end
end
