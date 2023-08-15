class ApiResponse<D, E> {
  D? data;
  Status status;
  E? error;

  ApiResponse.success(this.data) : status = Status.success;

  ApiResponse.error(this.error) : status = Status.error;
}

enum Status { success, error }