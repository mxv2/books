package com.objectmentor.utilities.args;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import static com.objectmentor.utilities.args.ErrorCode.*;

public class StringArrayArgumentMarshaler implements ArgumentMarshaler {
    private String[] stringArrayValue = new String[]{};

    public void set(Iterator<String> currentArgument) throws ArgsException {
        List<String> argStrings = new ArrayList<>();
        while (currentArgument.hasNext()) {
            String argString = currentArgument.next();
            if (argString.startsWith("-")) {
                break;
            } else {
                argStrings.add(argString);
            }
        }
        if (argStrings.isEmpty()) {
            throw new ArgsException(MISSING_STRING);
        }
        stringArrayValue = argStrings.toArray(new String[]{});
    }

    public static String[] getValue(ArgumentMarshaler am) {
        if (am != null && am instanceof StringArrayArgumentMarshaler)
            return ((StringArrayArgumentMarshaler) am).stringArrayValue;
        else
            return new String[]{};
    }
}
