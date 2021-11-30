function varargout = execFunc(funcName, varargin)
%     feval(funcName, varargin{:});
    evalc(['[varargout{1:nargout}] = feval(''' funcName ''', varargin{:})']);
end