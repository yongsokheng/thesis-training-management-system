class EvaluationsDatatable
  include AjaxDatatablesRails::Extensions::Kaminari

  delegate :params, :link_to, to: :@view

  def initialize view
    @view = view
    @current_user = @view.current_user
    @trainees = User.trainees
  end

  def as_json options = {}
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: users.total_count,
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
    if @current_user.is_admin?
      users = @trainees
    else
      courses = @current_user.user_courses.pluck :course_id
      users = @trainees.find_by_course courses
    end
    users = users.order("#{sort_column} #{sort_direction}")
      .per_page_kaminari(page).per per_page
    if params[:sSearch].present?
      users = users.where "users.name like :search", search: "%#{params[:sSearch]}%"
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
    columns = %w[id name]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
