class Functions {
    errorResponse(text, status = null, obj = null) {
        return {
            is_error: true,
            status,
            message: text,
            obj: obj,
        };
    }

    okResponse(text, status = null, obj = null) {
        return {
            is_error: false,
            status,
            message: text,
            obj: obj,
        };
    }
}
module.exports = Functions.prototype;