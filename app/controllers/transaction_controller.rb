class TransactionController < ApplicationController

  def show
    transactions = Transaction.where(transaction_id: params[:id])
    render json: transactions, status: :ok
  end

  def create
    begin
      transfer_service = TransferOperations.new(trs_params[:source_account_id], trs_params[:destination_account_id])
      if transfer_service.execute(trs_params[:amount])
        render json: {status: 200, message: "Transfer completed successfully."}, status: :ok
      end
    rescue => error
      render json: {status: 400, error: error.message}, status: :bad_request
    end
  end

  def destroy
    transactions = Transaction.where(transaction_id: params[:id])
    unless transactions.blank?
      transaction_id = Transaction.defineTransactionId

      transactions.each do |t|
        Transaction.create({
            account_id: t.account_id,
            amount: t.amount,
            transaction_id: transaction_id,
            transaction_type: t.transaction_type.eql?("DEBIT") ? "CREDIT" : "DEBIT"
        })
      end
      render json: {status: 200, message: "Transfer deleted successfully."}, status: :ok
    else
      render json: {status: 400, error: "Transaction does not exist."}, status: :bad_request
    end
  end

  private
  def trs_params
    params.permit(:source_account_id, :destination_account_id, :amount)
  end

end
