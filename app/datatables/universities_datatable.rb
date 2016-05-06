class UniversitiesDatatable
  include AjaxDatatablesRails::Extensions::Kaminari

  delegate :params, :link_to, to: :@view

  def initialize view
    @view = view
  end

  def as_json options = {}
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: University.count,
      iTotalDisplayRecords: universities.total_count,
      aaData: data
    }
  end

  private
  def data
    universities.each_with_index.map do |university, index|
      [
        index + 1,
        university.name,
        link_to(@view.t("button.edit"), @view.edit_admin_university_path(university),
          class: "text-primary pull-right"),
        link_to(@view.t("button.delete"), @view.admin_university_path(university),
          method: :delete, data: {confirm: @view.t("messages.delete.confirm")},
          class: "text-danger pull-right")
      ]
    end
  end

  def universities
    @universities ||= fetch_universities
  end

  def fetch_universities
    universities = University.order "#{sort_column} #{sort_direction}"
    universities = universities.per_page_kaminari(page).per per_page
    if params[:sSearch].present?
      universities = universities.where "name like :search", search: "%#{params[:sSearch]}%"
    end
    universities
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[name]
    columns[params[:iSortCol_1].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
