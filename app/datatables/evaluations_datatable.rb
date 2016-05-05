class EvaluationsDatatable
  include AjaxDatatablesRails::Extensions::Kaminari

  delegate :params, :link_to, to: :@view

  def initialize view
    @view = view
  end

  def as_json options = {}
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: User.find_by_role(Role.trainee).count,
      iTotalDisplayRecords: users.total_count,
      aaData: data
    }
  end

  private
  def data
    users.each_with_index.map do |user, index|
      [
        index + 1,
        link_to(user.name, @view.user_path(user)),
        user.evaluation_total_point,
        user.evaluation_current_rank,
        if user.evaluation.nil?
          link_to(@view.t("evaluations.evaluate"),
            @view.new_admin_user_evaluations_path(user),
            class: "pull-right")
        else
          link_to(@view.t("evaluations.evaluate"),
            @view.edit_admin_user_evaluations_path(user),
            class: "pull-right")
        end
      ]
    end
  end

  def users
    @users ||= fetch_users
  end

  def fetch_users
    users = User.find_by_role(Role.trainee).order "#{sort_column} #{sort_direction}"
    users = users.per_page_kaminari(page).per per_page
    if params[:sSearch].present?
      users = users.where "name like :search", search: "%#{params[:sSearch]}%"
    end
    users
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
